# 添付資料1(2) #

module SamplingModule
	# 標本化
	def sampling(sf, n, amp, freq, tau)
		for i in 0..n-1 do
			t = tau * i;
			sf[i] = amp * Math.sin(2.0 * Math::PI * freq * t);
			sf[i] = sf[i].round(3);
		end
	end

	module_function :sampling;
end