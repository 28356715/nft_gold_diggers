export const LIST_TEMPLATES = `
  import DappyContract from 0xDappy

  pub fun main(): {UInt32: DappyContract.Template} {
    let templates = DappyContract.listTemplates()
    return templates
  }
`;