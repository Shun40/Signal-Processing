module CalcModule
	# 数値型変換メソッド
	# 整数化(小数点以下切り捨て)
	def toInteger(number)
		return number.to_i();
	end
	# 実数化
	def toFloat(number)
		return number.to_f();
	end

	# 基数変換メソッド
	# 2進数へ変換(2の補数表現使用)
	def toBinary(number, bit)
		if number >= 0 then
			return sprintf("%0" + bit.to_s() + "d", number.to_s(2));
		else
			number = number.abs();
			number = (number ^ ((2 ** bit) - 1)) + 1;
			return number.to_s(2);
		end
	end

	# 特殊計算メソッド
	# 累乗計算
	def getExponentiation(number, exponent)
		return number ** exponent;
	end
	# 小数点第何位かを指定して数値を四捨五入
	def roundDecimalPoint(number, point)
		return number.round(point);
	end

	# 数値の範囲チェックメソッド
	# 数値が範囲内にあるかチェック
	def isNumberInRange(num, start, fin)
		if start <= num && num < fin then
			return true;
		else
			return false;
		end
	end
	# 数値が上限値以上かチェック
	def isNumberMax(num, max)
		if num >= max then
			return true;
		else
			return false;
		end
	end
	# 数値が下限値以下かチェック
	def isNumberMin(num, min)
		if num <= min then
			return true;
		else
			return false;
		end
	end
end