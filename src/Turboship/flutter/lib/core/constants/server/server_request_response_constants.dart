class ServerRequestResponseConstants {
  const ServerRequestResponseConstants._();

  // Gender
  static const male = 'male';
  static const female = 'female';
  static const nonbinary = 'nonbinary';
  static const nondisclosure = 'nondisclosure';

  // transaction type
  static const deposit = 'deposit';
  static const withdrawal = 'withdraw';
  static const interestAccrual = 'interest_accrual';

  // transaction status
  static const initiated = 'initiated';
  static const cancel = 'cancel';
  static const approved = 'approved';
  static const processing = 'processing';
  static const failure = 'failure';
  static const success = 'success';
}
