class SinWaveParameter
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai2/SinWave/SinWaveParameterReader.rb';

	# コンストラクタ
	def initialize()
		reader = SinWaveParameterReader.new();
		@vMax = reader.parameter[0]; # 電圧最大値[V]
		@vMin = reader.parameter[1]; # 電圧最小値[V]
		@vAmplitude = reader.parameter[2]; # 振幅[V]
		@waveFrequency = reader.parameter[3]; # 周波数[Hz]
	end

	# アクセスメソッド
	attr_reader :vMax;
	attr_reader :vMin;
	attr_reader :vAmplitude;
	attr_reader :waveFrequency;
end