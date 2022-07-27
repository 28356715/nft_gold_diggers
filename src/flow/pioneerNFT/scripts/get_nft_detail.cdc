


 import PioneerNFT from "../cadence/PioneerNFT.cdc"

pub fun main(account: Address,ids:[UInt64]):[PioneerNFT.PioneerNFTMetadataView]{

      let account = getAccount(account)

    let collectionRef = account.getCapability(PioneerNFT.CollectionPublicPath)
                            .borrow<&{PioneerNFT.PioneerNFTCollectionPublic}>()!
    

    var i=0
    var res:[PioneerNFT.PioneerNFTMetadataView]=[]
    while i<ids.length {

        let nft =collectionRef.borrowPioneerNFT(id: ids[i]) ?? panic("The NFT does not exist")
        let view = nft.resolveView(Type<PioneerNFT.PioneerNFTMetadataView>())!
        let PioneerNFTDisplay =view as! PioneerNFT.PioneerNFTMetadataView
        res.append(PioneerNFTDisplay)
        i=i+1
    }
    return res

}