module CalcModule
	# 定数の定義
	PI = 3.14; # 円周率

	# A/D変換向け計算メソッド
	# サンプリング回数の計算
	def calcSamplingCount(samplingTime, samplingCycle)
		return toInteger(samplingTime / samplingCycle);
	end
	# 角周波数の計算
	def calcCircularFrequency(waveFrequency)
		return 2 * PI * waveFrequency;
	end
	# 三角関数の時刻の計算
	def calcTime(t, samplingCycle)
		return t * samplingCycle;
	end
	# 量子化幅の計算
	def calcQuantizationWidth(amplitude, quantizationBit)
		floatAmplitude = toFloat(amplitude);
		bitNumber = calcPower(2, quantizationBit);
		quantizationWidth = floatAmplitude / (bitNumber - 1);
		return roundDecimalPoint(quantizationWidth, 3);
	end

	# 汎用計算メソッド
	# 整数化(小数点以下切り捨て)
	def toInteger(number)
		return number.to_i();
	end
	# 実数化
	def toFloat(number)
		return number.to_f();
	end
	# 累乗計算
	def calcPower(number, pow)
		return number ** pow;
	end
	# 小数点第何位かを指定して数値を四捨五入
	def roundDecimalPoint(number, point)
		return number.round(point);
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
end