import PioneerNFT from "../cadence/PioneerNFT.cdc"
import NonFungibleToken from "../cadence/NonFungibleToken.cdc"
import FlowToken from "../cadence/FlowToken.cdc"
import FungibleToken from "../cadence/FungibleToken.cdc"
import PioneerMarketplace from "../cadence/PioneerMarketplace.cdc"

transaction(name: String,
            description: String,
            url: String,
            activeStatus: UInt8,
            nftType: Type,
            saleItemID: UInt64, 
            partAmount: UFix64,
            createTime: UFix64,
            targetAmount: UFix64,
            divisionCount: UInt64,
            startTime: UFix64,
            endTime: UFix64,
            ){
    let storefront: &PioneerMarketplace.Storefront
    let flowReceiver: Capability<&FlowToken.Vault{FungibleToken.Receiver}>
    let PioneerNFTProvider: Capability<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>
    let creatorAddress: Address

    prepare(account: AuthAccount){

         if account.borrow<&PioneerMarketplace.Storefront>(from: PioneerMarketplace.StorefrontActivityStoragePath) == nil {

            // Create a new empty .Storefront
            let storefront <- PioneerMarketplace.createStorefront() as! @PioneerMarketplace.Storefront
            
            // save it to the account
            account.save(<-storefront, to: PioneerMarketplace.StorefrontActivityStoragePath)

            // create a public capability for the .Storefront
            account.link<&PioneerMarketplace.Storefront{PioneerMarketplace.StorefrontPublic}>(PioneerMarketplace.StorefrontActivityPublicPath, target: PioneerMarketplace.StorefrontActivityStoragePath)
        }

        self.storefront= account.borrow<&PioneerMarketplace.Storefront>(from: PioneerMarketplace.StorefrontActivityStoragePath)!

        self.flowReceiver = account.getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
        assert(self.flowReceiver.borrow() != nil, message: "Missing or mis-typed FlowToken receiver")

        let PioneerNFTCollectionProviderPrivatePath=/private/PioneerNFTCollection

        self.creatorAddress=account.address

        if !account.getCapability<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(PioneerNFTCollectionProviderPrivatePath)!.check() {
            account.link<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(PioneerNFTCollectionProviderPrivatePath, target: PioneerNFT.CollectionStoragePath)
        }

        self.PioneerNFTProvider = account.getCapability<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(PioneerNFTCollectionProviderPrivatePath)!
        assert(self.PioneerNFTProvider.borrow() != nil, message: "Missing or mis-typed PioneerNFT.Collection provider")
    }


 
     

    execute{
        
        let activeID= self.storefront.createActivity(
            name:name,
            description:description,
            url:url,
            activeStatus:activeStatus,
            nftType: Type<@PioneerNFT.NFT>(),
            nftID: saleItemID,
            creator:self.creatorAddress,
            createTime:createTime,
            targetAmount:targetAmount,
            currentAmount:0.0,
            minPartAmount:targetAmount/UFix64(divisionCount),
            divisionCount:divisionCount,
            startTime: startTime,
            endTime: endTime,
            receiver:self.flowReceiver,
            externalUrl:"",
         )

          self.storefront.createListing(
            nftProviderCapability:self.PioneerNFTProvider,
            nftType: Type<@PioneerNFT.NFT>(),
            nftID: saleItemID,
            salePaymentVaultType: Type<@FlowToken.Vault>(),
            receiver:self.flowReceiver,
            salePrice:targetAmount,
            minPrice: partAmount,
            itemStatus:1
            activeID: activeID
            )
    }
}

