# 添付資料3(3) #

module QuantizeModule
	# モジュールの読み込み
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3++/Src/MathModule.rb";

	# 量子化
	def quantize(sf, qf, n, vmax, vmin, w, e)
		qmin = -(e / 2); # 整数値の最小値
		qmax = (e / 2) - 1; # 整数値の最大値
		for i in 0..n-1 do
			for q in qmin..qmax do
				v1 = (q * w).round(3);
				v2 = (q * w + w).round(3);
				if MathModule.isNumberInRange(sf[i], v1, v2) then
					qf[i] = q;
					break;
				elsif MathModule.isNumberMax(sf[i], vmax - w) then
					qf[i] = qmax;
					break;
				elsif MathModule.isNumberMin(sf[i], vmin) then
					qf[i] = qmin;
					break;
				end
			end
		end
	end

	module_function :quantize;
end