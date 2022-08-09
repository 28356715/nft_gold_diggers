
import PioneerMarketplace from "../cadence/PioneerMarketplace.cdc"

transaction() {
    
    prepare(account: AuthAccount){

         if account.borrow<&PioneerMarketplace.Storefront>(from: PioneerMarketplace.StorefrontActivityStoragePath) == nil {

            // Create a new empty .Storefront
            let storefront <- PioneerMarketplace.createStorefront() as! @PioneerMarketplace.Storefront
            
            // save it to the account
            account.save(<-storefront, to: PioneerMarketplace.StorefrontActivityStoragePath)

            // create a public capability for the .Storefront
            account.link<&PioneerMarketplace.Storefront{PioneerMarketplace.StorefrontPublic}>(PioneerMarketplace.StorefrontActivityPublicPath, target: PioneerMarketplace.StorefrontActivityStoragePath)
        }

    }
    execute{

    }
}