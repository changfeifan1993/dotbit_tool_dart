final dasIndexUrl = 'https://indexer.da.systems/';
final dasRegisterBaseUrl = 'https://register-api.da.systems/';
final dasUrl = 'https://indexer.da.systems/';
final jkUrl = 'jike';

final dasEditRecordUrl = dasRegisterBaseUrl + 'v1/account/edit/records';
final dasTransactionSendUrl = dasRegisterBaseUrl + 'v1/transaction/send';
final dasPostBitToGetAccountDetail = dasRegisterBaseUrl + 'v1/account/detail';
final dasPostBitToGetAccountRecord = dasRegisterBaseUrl + 'v1/account/records';
final dasPostAddressToGetMineList = dasRegisterBaseUrl + 'v1/account/mine';
final dasPostAddressToGetBalanceInfo = dasRegisterBaseUrl + 'v1/balance/info';
final dasPostToGetAccountOrderDetail = dasRegisterBaseUrl + 'v1/account/order/detail';
final dasPostToRegisterAccountOrder = dasRegisterBaseUrl + 'v1/account/order/register';
final dasPostToBalancePay = dasRegisterBaseUrl + 'v1/balance/pay';


// SearchStatusRegisterNotOpen SearchStatus = -1 //未开放注册
// SearchStatusRegisterAble SearchStatus = 0 //可注册
// SearchStatusPaymentConfirm SearchStatus = 1 //支付确认
// SearchStatusLockedAccount SearchStatus = 2 //账户锁定
// SearchStatusRegistering SearchStatus = 3 //注册中
// SearchStatusProposal SearchStatus = 4 //提案中
// SearchStatusConfirmProposal SearchStatus = 5 //确认提案
// SearchStatusRegistered SearchStatus = 6 //已注册
// SearchStatusRetainAccount SearchStatus = 7 // 保留账户
// SearchStatusOnSale SearchStatus = 8 // 出售
// SearchStatusOnAuction SearchStatus = 9 // 竞拍
// SearchStatusUnAvailableAccount SearchStatus = 13 // 禁止账户
final dasPostToSearch = dasRegisterBaseUrl + 'v1/account/search';

// ActionUndefined TxAction = 99 // 未定义
// ActionWithdrawFromWallet TxAction = 0 // 提现
// ActionConsolidateIncome TxAction = 1 // 奖励
// ActionStartAccountSale TxAction = 2 // 上架一口价
// ActionEditAccountSale TxAction = 3 // 编辑一口价
// ActionCancelAccountSale TxAction = 4 // 取消一口价
// ActionBuyAccount TxAction = 5 // 买账号
// ActionSaleAccount TxAction = 6 // 卖账号
// ActionTransferBalance TxAction = 7 // 激活余额
// ActionDeclareReverseRecord TxAction = 8 // 设置解析记录
// ActionRedeclareReverseRecord TxAction = 9 // 修改解析记录
// ActionRetractReverseRecord TxAction = 10 // 删除解析记录
// ActionDasBalanceTransfer TxAction = 11 // 转账,das 余额注册
// ActionEditRecords TxAction = 12 // 修改解析记录
// ActionTransferAccount TxAction = 13 // 修改 owner
// ActionEditManager TxAction = 14 // 修改manager
final dasTransactionStatusUrl = dasRegisterBaseUrl + 'v1/transaction/status';


class ApiErrorCode {
  // ApiCodeSuccess        ApiCode = 0
  // ApiCodeError500       ApiCode = 500
  // ApiCodeParamsInvalid  ApiCode = 10000 // 请求参数错误
  // ApiCodeMethodNotExist ApiCode = 10001
  // ApiCodeDbError        ApiCode = 10002 // 数据库错误
  // ApiCodeCacheError     ApiCode = 10003 // 缓存错误
  //
  // ApiCodeTransactionNotExist ApiCode = 11001 // 交易不存在
  // ApiCodePermissionDenied    ApiCode = 11002 // 权限不足
  // ApiCodeInsufficientBalance ApiCode = 11007 // 余额不足
  // ApiCodeTxExpired           ApiCode = 11008 // 交易过期
  // ApiCodeRejectedOutPoint    ApiCode = 11011 // cell 抢占
  // ApiCodeNotEnoughChange     ApiCode = 11014 // 不够找零
  // ApiCodeSyncBlockNumber     ApiCode = 11012 // 同步区块高度
  // ApiCodeOperationFrequent   ApiCode = 11013 // 操作频繁
  //
  // ApiCodeReverseAlreadyExist ApiCode = 12001 // 已存在该反向解析
  // ApiCodeReverseNotExist     ApiCode = 12002 // 不存在该反向解析
  //
  // ApiCodeAccountNotExist ApiCode = 30003 // 账号不存在
  // ApiCodeSystemUpgrade   ApiCode = 30019 // 系统升级

  static int get ApiCodeSuccess => 0;

  static get ApiCodeError500 => 500;

  static get ApiCodeParamsInvalid => 10000;

  static get ApiCodeMethodNotExist => 10001;

  static get ApiCodeDbError => 10002;

  static get ApiCodeCacheError => 10003;

  static get ApiCodeTransactionNotExist => 11001;

  static get ApiCodePermissionDenied => 11002;

  static get ApiCodeInsufficientBalance => 10007;

  static get ApiCodeTxExpired => 11008;

  static get ApiCodeRejectedOutPoint => 11011;

  static get ApiCodeNotEnoughChange => 11014;

  static get ApiCodeSyncBlockNumber => 11012;

  static get ApiCodeOperationFrequent => 11013;

  static get ApiCodeReverseAlreadyExist => 12001;

  static get ApiCodeReverseNotExist => 12002;

  static get ApiCodeAccountNotExist => 30003;

  static get ApiCodeSystemUpgrade => 30019;


  static getErrorCodeInfo(int code) {
    switch (code) {
      case 0:
        return '成功';
      case 500:
        return 'error500';
    }
    return 'unknown code';
  }


}