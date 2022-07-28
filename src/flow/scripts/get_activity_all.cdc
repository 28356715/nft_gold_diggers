import PioneerMarketplace from "../cadence/PioneerMarketplace.cdc"


pub fun main():[PioneerMarketplace.Activity]{
    var all_activity:[PioneerMarketplace.Activity]=[]
    var addrKeys=PioneerMarketplace.activityMapping.keys
    var i=0
    while i<addrKeys.length {
        all_activity.append(PioneerMarketplace.getActivity(id:addrKeys[i]))
        i=i+1
    }
    return all_activity
}


