class ADConverter
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverter/ADConverterDisplay.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/FunctionGenerator/FunctionGenerator.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/SamplingParameter/SamplingParameter.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverterDevice/SamplingDevice.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverterDevice/QuantizationDevice.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverterDevice/EncodingDevice.rb';
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize()
		@display = ADConverterDisplay.new(self); # ディスプレイ
		@samplingParameter = SamplingParameter.new(); # サンプリングパラメータ
		@samplingDevice = self.createSamplingDevice(); # 標本化デバイス
		@quantizationDevice = self.createQuantizationDevice(); # 量子化デバイス
		@encodingDevice = self.createEncodingDevice(); # 符号化デバイス
	end

	# 標本化デバイス生成
	def createSamplingDevice()
		sTime = @samplingParameter.samplingTime;
		sCycle = @samplingParameter.samplingCycle;
		sCount = getSamplingCount(sTime, sCycle);
		return SamplingDevice.new(sCount, sCycle);
	end
	# 量子化デバイス生成
	def createQuantizationDevice()
		fg = FunctionGenerator.new();
		vMax = fg.sinWaveParameter.vMax;
		vMin = fg.sinWaveParameter.vMin;
		vAmp = fg.sinWaveParameter.vAmplitude;
		sTime = @samplingParameter.samplingTime;
		sCycle = @samplingParameter.samplingCycle;
		sCount = getSamplingCount(sTime, sCycle);
		qBit = @samplingParameter.quantizationBit;
		w = getQuantizationWidth(vAmp, qBit);
		e = getExponentiation(2, qBit);
		return QuantizationDevice.new(vMin, vMax, sCount, w, e);
	end
	# 符号化デバイス生成
	def createEncodingDevice()
		sTime = @samplingParameter.samplingTime;
		sCycle = @samplingParameter.samplingCycle;
		sCount = getSamplingCount(sTime, sCycle);
		qBit = @samplingParameter.quantizationBit;
		return EncodingDevice.new(sCount, qBit);
	end

	# 標本化
	def sampling()
		@samplingDevice.sampling(FunctionGenerator.new());
	end
	# 量子化
	def quantize()
		@quantizationDevice.quantize(@samplingDevice.sData);
	end
	# 符号化
	def encoding()
		@encodingDevice.encoding(@quantizationDevice.qData);
	end

	# 標本化結果を出力
	def writeSamplingData()
		@samplingDevice.writeData();
	end
	# 量子化結果を出力
	def writeQuantizationData()
		@quantizationDevice.writeData();
	end
	# 符号化結果を出力
	def writeEncodingData()
		@encodingDevice.writeData();
	end

	# サンプリングパラメータの表示
	def displaySamplingParameter()
		@display.displaySamplingParameter();
	end
	# 標本化結果の出力ファイルのパス表示
	def displaySamplingDataFile()
		@display.displaySamplingDataFile();
	end
	# 量子化結果の出力ファイルのパス表示
	def displayQuantizationDataFile()
		@display.displayQuantizationDataFile();
	end
	# 符号化結果の出力ファイルのパス表示
	def displayEncodingDataFile()
		@display.displayEncodingDataFile();
	end

	# アクセスメソッド
	attr_reader :samplingParameter;
	attr_reader :samplingDevice;
	attr_reader :quantizationDevice;
	attr_reader :encodingDevice;
end