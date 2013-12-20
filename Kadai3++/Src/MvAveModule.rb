# 添付資料3(2) #

module MvAveModule
	# モジュールの読み込み
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3++/Src/MathModule.rb";

	# 単純移動平均
	def sma(wnsf, sf, n, point)
		start = MathModule.toInteger(point);
		fin = MathModule.toInteger(n - point - 1);
		# 左側平滑化範囲外のデータ取得
		for i in 0..start-1 do
			sf[i] = wnsf[i];
		end
		# 平滑化範囲内のデータ取得
		for i in start..fin-1 do
			data = 0.0;
			for j in (i - point)..(i + point) do
				data += wnsf[j];
			end
			data /= (point * 2 + 1);
			sf[i] = data.round(3);
		end
		# 右側平滑化範囲外のデータ取得
		for i in fin..n-1 do
			sf[i] = wnsf[i];
		end
	end

	module_function :sma;
end