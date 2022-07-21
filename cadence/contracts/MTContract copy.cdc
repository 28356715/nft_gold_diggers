
import FungibleToken from 0x9a0766d93b6608b7

pub contract MTContract {
  access(self) var nfts: {UInt32: NftMt}
  access(self) var nftMetaData: {UInt32: NftMt}
  access(self) var onSalesMetaData: {UInt32: NftMt}

  pub var totalNFTs: UInt64
  
  
  pub let CollectionStoragePath: StoragePath
  pub let CollectionPublicPath: PublicPath



  pub enum Type:UInt8 {
      pub case animation
      pub case celebrity
      pub case history
  }

  pub fun typeToString(_ type:Type):String {
      switch type {
          case Type.animation:
                return "animation"
           case Type.celebrity
                return "celebrity"
            case Type.history
                return "history"
      }
      return ""
  }
//nft struct
  pub struct NftMt {
    // pub let templateID: UInt32
    //系列
    pub let name: String
    pub let type:Type
    //售价
    pub let desc:String
    pub let imgAddr:String
     

    init(name: String,price:UFix64,desc:String,type:UInt32,imgAddr:String) {
      self.name = name
      self.desc=desc
      self.type=type
      self.imgAddr=imgAddr
    }
  }

  //resource nft
  pub resource NFT {
    pub let id: UInt64
    pub let data: NftMt

    init(id:UInt64) {
      self.id = id
    }
  }
  pub resource NFTMinter {
      pub fun mintNFT() :@NFT{
          return <- create MTContract.NFT(id:self.totalNFTs)
          self.totalNFTs = self.totalNFTs+ 1 as UInt64
      }
  }

  pub fun createEmptyCollection():@Collection {
      return <- create Collection()
  }

  pub resource interface Receiver {
    pub fun deposit(token:@NFT)
  }
    pub resource interface Provider {
    pub fun withdraw(withdrawID: UInt64): @NFT
  }

    pub resource interface CollectionPublic {
    pub fun deposit(token: @Dappy)
    pub fun getIDs(): [UInt64]
  }

 pub resource Collection: CollectionPublic, Provider, Receiver {
    pub var ownedNfts: @{UInt64: NFT}

    // delete a nft from collection 
    pub fun withdraw(withdrawID: UInt64): @NFT {
      let token <- self.ownedNfts.remove(key: withdrawID) 
        ?? panic("Could not withdraw dappy: dappy does not exist in collection")
      return <-token
    }
    //add a nft to collection
    pub fun deposit(token: @NFT,metadata:nftMt) {
      self.nftMetaData[token.id] = metadata
      let oldToken <- self.ownedNfts[token.id] <- token
      destroy oldToken
    }

    pub fun getIDs(): [UInt64] {
      return self.ownedNfts.keys
    }

    destroy() {
      destroy self.ownedNfts
    }

    init() {
      self.ownedNfts <- {}
    }
  }

  pub fun listNftMetaData(): {UInt32: Template} {
    return self.nftMetaData
  }
   

  init() {
    self.nftMetaData = {}
    self.onSalesMetaData = {}
    self.totalNFTs = 0

    self.CollectionStoragePath = /storage/MTCollection
    self.CollectionPublicPath = /public/MTCollectionPublic

    self.account.save(<-self.createEmptyCollection(),to:self.CollectionStoragePath)
  }

}