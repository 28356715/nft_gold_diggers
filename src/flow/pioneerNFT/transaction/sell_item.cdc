import PioneerNFT from "../cadence/PioneerNFT.cdc"
import NonFungibleToken from "../cadence/NonFungibleToken.cdc"
import FlowToken from "../cadence/FlowToken.cdc"
import FungibleToken from "../cadence/FungibleToken.cdc"
import PioneerMarketplace from "../cadence/PioneerMarketplace.cdc"



transaction(saleItemID: UInt64, saleItemPrice: UFix64){
    let storefront: &PioneerMarketplace.Storefront
    let flowReceiver: Capability<&AnyResource{FungibleToken.Provider, FungibleToken.Receiver}>
    let PioneerNFTProvider: Capability<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>

    prepare(account: AuthAccount){

         if account.borrow<&PioneerMarketplace.Storefront>(from: PioneerMarketplace.StorefrontStoragePath) == nil {

            // Create a new empty .Storefront
            let storefront <- PioneerMarketplace.createStorefront() as! @PioneerMarketplace.Storefront
            
            // save it to the account
            account.save(<-storefront, to: PioneerMarketplace.StorefrontStoragePath)

            // create a public capability for the .Storefront
            account.link<&PioneerMarketplace.Storefront{PioneerMarketplace.StorefrontPublic}>(PioneerMarketplace.StorefrontPublicPath, target: PioneerMarketplace.StorefrontStoragePath)
        }

        self.storefront= account.borrow<&PioneerMarketplace.Storefront>(from: PioneerMarketplace.StorefrontStoragePath)!
        self.flowReceiver=account.borrow<&AnyResource{FungibleToken.Provider,FungibleToken.Receiver}>(from :/storage/flowTokenReceiver)!

       // self.flowReceiver = account.getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
        assert(self.flowReceiver.borrow() != nil, message: "Missing or mis-typed FlowToken receiver")

        let PioneerNFTCollectionProviderPrivatePath=/private/PioneerNFTCollection


        if !account.getCapability<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(PioneerNFTCollectionProviderPrivatePath)!.check() {
            account.link<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(PioneerNFTCollectionProviderPrivatePath, target: PioneerNFT.CollectionStoragePath)
        }

        self.PioneerNFTProvider = account.getCapability<&PioneerNFT.Collection{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(PioneerNFTCollectionProviderPrivatePath)!
        assert(self.PioneerNFTProvider.borrow() != nil, message: "Missing or mis-typed PioneerNFT.Collection provider")
    }


  
    execute{
        

          self.storefront.createListing(
            nftProviderCapability:self.PioneerNFTProvider,
            nftType: Type<@PioneerNFT.NFT>(),
            nftID: saleItemID,
            salePaymentVaultType: Type<@FlowToken.Vault>(),
            receiver:self.flowReceiver,
            salePrice: saleItemPrice,
            minPrice: nil,
            itemStatus:4,
            activeID: nil
            )
    }
}

