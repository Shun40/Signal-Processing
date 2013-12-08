class MovingAverageParameter
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/MovingAverage/MovingAverageParameterReader.rb';

	# コンストラクタ
	def initialize()
		reader = MovingAverageParameterReader.new();
		@movingPoint = reader.parameter[0]; # 移動点数
	end

	# アクセスメソッド
	attr_reader :movingPoint;
end