# 添付資料2(2) #

module WhiteNoiseModule
	# モジュールの読み込み
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai2++/Src/MathModule.rb";

	# ホワイトノイズ付与
	def whiteNoise(wn, sf, n, vmax, vmin)
		for i in 0..n-1 do
			loop {
				x = Random.rand();
				y = Random.rand();
				z = Math.sqrt(-2.0 * Math.log(x)) * Math.sin(2.0 * Math::PI * y);
				if MathModule.isNumberInRange(z, vmin, vmax) then
					wn[i] = z.round(3);
					break;
				end
			}
			sf[i] += wn[i];
		end
	end

	module_function :whiteNoise;
end