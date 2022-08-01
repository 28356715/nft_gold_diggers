import PioneerMarketplace from 0xf3b742ab419080e3
//99020071
transaction(listingResourceID: UInt64) {
    let storefront: &PioneerMarketplace.Storefront{PioneerMarketplace.StorefrontManager}

    prepare(acct: AuthAccount) {
        self.storefront = acct.borrow<&PioneerMarketplace.Storefront{PioneerMarketplace.StorefrontManager}>(from: PioneerMarketplace.StorefrontStoragePath)
            ?? panic("Missing or mis-typed PioneerMarketplace.Storefront")
    }

    execute {
        self.storefront.removeListing(listingResourceID: listingResourceID)
    }
}