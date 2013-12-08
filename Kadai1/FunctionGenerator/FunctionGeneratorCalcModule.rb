module FunctionGeneratorCalcModule
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/CalcModule.rb';
	include CalcModule;
	# 定数の定義
	PI = 3.14; # 円周率

	# 角周波数の計算
	def getCircularFrequency(waveFrequency)
		return 2 * PI * waveFrequency;
	end
end