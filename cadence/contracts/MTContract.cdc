
import FungibleToken from 0x9a0766d93b6608b7

pub contract MTContract {
  access(self) var templates: {UInt32: Template}
  

  pub var totalDappies: UInt64
  
  
  pub let CollectionStoragePath: StoragePath
  pub let CollectionPublicPath: PublicPath
  pub let AdminStoragePath: StoragePath
  pub let cost: UFix64


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
  pub resource NFT {
    pub let id: UInt64
    pub let data: NftMt

    init(id:UInt64,nftMt: NftMt) {
      self.id = id
      self.nftMt = nftMt
    }
  }
  pub resource NFTMinter {
      pub fun mintNFT(name: String,desc:String,type:Type,imgAddr:String) :@NFT{
          let nftMt = NftMt(name:name,desc:desc,type:type,imgAddr:imgAddr)
          self.totalNFTs = self.totalNFTs+1
          return <- create MTContract.NFT(id:self.totalNFTs,NftMt:nftMt)


      }
  }

 pub resource Collection: CollectionPublic, Provider, Receiver {
    pub var ownedDappies: @{UInt64: Dappy}

    pub fun withdraw(withdrawID: UInt64): @Dappy {
      let token <- self.ownedDappies.remove(key: withdrawID) 
        ?? panic("Could not withdraw dappy: dappy does not exist in collection")
      return <-token
    }

    pub fun deposit(token: @Dappy) {
      let oldToken <- self.ownedDappies[token.id] <- token
      destroy oldToken
    }

    pub fun batchDeposit(collection: @Collection) {
      let keys = collection.getIDs()
      for key in keys {
        self.deposit(token: <-collection.withdraw(withdrawID: key))
      }
      destroy collection
    }

    pub fun getIDs(): [UInt64] {
      return self.ownedDappies.keys
    }

    pub fun listDappies(): {UInt64: Template} {
      var dappyTemplates: {UInt64:Template} = {}
      for key in self.ownedDappies.keys {
        let el = &self.ownedDappies[key] as &Dappy
        dappyTemplates.insert(key: el.id, el.data)
      }
      return dappyTemplates
    }

    destroy() {
      destroy self.ownedDappies
    }

    init() {
      self.ownedDappies <- {}
    }
  }
   

  init() {
    self.templates = {}
    self.totalNFTs = 0
    self.CollectionStoragePath = /storage/DappyCollection
    self.CollectionPublicPath = /public/DappyCollectionPublic
    self.AdminStoragePath = /storage/DappyAdmin
    self.cost = 1.00
  }

}