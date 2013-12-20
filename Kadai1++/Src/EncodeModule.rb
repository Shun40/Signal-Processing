# 添付資料1(4) #

module EncodeModule
	# モジュールの読み込み
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai1++/Src/MathModule.rb";

	# 符号化
	def encode(qf, ef, n, bit)
		for i in 0..n-1 do
			ef[i] = MathModule.toBinary(qf[i], bit);
		end
	end

	module_function :encode;
end