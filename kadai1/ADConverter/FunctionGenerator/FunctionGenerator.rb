class FunctionGenerator
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverter/FunctionGenerator/FunctionGeneratorDisplay.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverter/FunctionGenerator/SinWave/SinWaveParameter.rb';
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverter/FunctionGenerator/FunctionGeneratorCalcModule.rb';
	include FunctionGeneratorCalcModule;

	# コンストラクタ
	def initialize()
		@display = FunctionGeneratorDisplay.new(self);
		@sinWaveParameter = SinWaveParameter.new();
	end

	# sin波生成
	def generateSinWave(time)
		vAmp = @sinWaveParameter.vAmplitude / 2;
		omega = getCircularFrequency(@sinWaveParameter.waveFrequency);
		return vAmp * Math.sin(omega * time);
	end

	# sin波のパラメータの表示
	def displaySinWaveParameter()
		@display.displaySinWaveParameter();
	end

	# アクセスメソッド
	attr_reader :sinWaveParameter;
end