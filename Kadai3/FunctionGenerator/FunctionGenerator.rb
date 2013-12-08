class FunctionGenerator
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/FunctionGenerator/FunctionGeneratorDisplay.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/SinWave/SinWaveParameter.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/WhiteNoise/WhiteNoiseParameter.rb';
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/FunctionGenerator/FunctionGeneratorCalcModule.rb';
	include FunctionGeneratorCalcModule;

	# コンストラクタ
	def initialize()
		@display = FunctionGeneratorDisplay.new(self);
		@sinWaveParameter = SinWaveParameter.new();
		@whiteNoiseParameter = WhiteNoiseParameter.new();
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

	# ホワイトノイズ
	def generateWhiteNoise()
		noiseMin = @whiteNoiseParameter.noiseMin;
		noiseAmp = @whiteNoiseParameter.noiseAmplitude;
		return noiseMin + rand() * noiseAmp;
	end

	# ホワイトノイズのパラメータの表示
	def displayWhiteNoiseParameter()
		@display.displayWhiteNoiseParameter();
	end

	# アクセスメソッド
	attr_reader :sinWaveParameter;
	attr_reader :whiteNoiseParameter;
end