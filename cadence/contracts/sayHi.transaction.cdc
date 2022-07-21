//本地网络的话就相对路径导入，网络部署的合约通过合约地址导入
import Hello from "./hello.cdc"

transaction {
    let name: String
    prepare(account:AuthAccount) {
        self.name = account.address.toString()
    }
    execute {
        Hello.sayHi(to:self.name)
    }
}