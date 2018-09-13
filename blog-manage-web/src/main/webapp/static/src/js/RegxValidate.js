var RegxUtil = {
		
	/**
	 * 手机号正则验证
	 * 
	 * @param str
	 *            手机号
	 * @returns {Boolean} true 不是手机格式 false 是手机格式
	 */
	isNotPhone : function(str) {// 验证手机格式
		if (!(/^(19[0-9]|13[0-9]|15[012356789]|166|17[3678]|18[0-9]|14[57])[0-9]{8}$/).test(str)) {
			return true;
		}
	},
	
	/**
	 * 汉字正则验证
	 * 
	 * @param str
	 * 			汉字
	 * @returns {Boolean} true 不是汉字格式 false 是汉字格式
	 */
	isNotCharacter : function(str){
		if (!(/^[\u4e00-\u9fa5]{0,}$/).test(str)){
			return true;
		}
	},
	
	/**
	 * 英文字母正则验证
	 * 
	 * @param str
	 * 			英文
	 * @returns {Boolean} true 不是英文格式 false 是英文格式
	 */
	isNotPinyin : function(str){
		if (!(/^[A-Za-z]+$/).test(str)){
			return true;
		}
	},
	
	/**
	 * 邮箱正则验证
	 * 
	 * @param str
	 * 			邮箱
	 * @returns {Boolean} true 不是邮箱格式 false 是邮箱格式
	 */
	isNotEmail : function(str){
		if (!(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/).test(str)){
			return true;
		}
	},
	
	/**
	 * 身份证号正则验证
	 * 15位、18位数字，最后一位是校验位，可能为数字或字符X
	 * @param str
	 * 			身份证号
	 * @returns {Boolean} true 不是身份证号格式 false 是身份证号格式
	 */
	isNotIdCard : function(str){
		if(!(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/).test(str)){
			return true;
		}
	},
	
	/**
	 * 电话号码正则验证
	 * 国内电话号码
	 * @param str
	 * 			电话号码
	 * @returns {Boolean} true 不是电话号码格式 false 是电话号码格式
	 */
	isNotTelphone : function(str){
		if(!(/\d{3}-\d{8}|\d{4}-\d{7}/).test(str)){
			return true;
		}
	},
	
	/**
	 * 密码是否合法正则验证
	 * 8到18位，至少含数字、字母或字符2种组合
	 * @param str
	 * 			密码
	 * @returns {Boolean} true 密码格式不合法 false 密码格式合法
	 */
	isNotPwd : function(str){
		if(!(/^(?![A-Z\W_!@#$%^&*`~()-+=]+$)(?![a-z0-9]+$)(?![a-z\W_!@#$%^&*`~()-+=]+$)(?![0-9\W_!@#$%^&*`~()-+=]+$)[a-zA-Z0-9\W_!@#$%^&*`~()-+=]{8,16}$/).test(str)){
			return true;
		}
	},
	
	/**
	 * 验证登录名
	 * 6-16位字母、数字
	 * 
	 * @param str
	 * @returns {Boolean}true 密码格式不合法 false 密码格式合法
	 */
	isNotUserName : function(str) {
		if(!(/^[a-zA-Z0-9_-]{6,16}$/).test(str)) {
			return true;
		}
	},
	
	/**
	 * 检验字符长度
	 * 
	 * @param str 校验字符
	 * @returns
	 */
	getCharLength : function(str) {
		return str.replace(/[\u0391-\uFFE5]/g,"aa").length;
	},
	
	/**
	 * 校验字符是否为空
	 * 
	 * @param str
	 * @returns {Boolean}
	 */
	isEmpty : function(str) {
		// 判断字符串是否为空
		if (str == null || str == undefined || str == '') {
			return true;
		} else {
			return false;
		}
	}
		
};