class ADConverter
	# 外部ファイル読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverterDisplay.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/FunctionGenerator/FunctionGenerator.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/SamplingParameter/SamplingParameter.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/MovingAverage/MovingAverageParameter.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverterDevice/SamplingDevice.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverterDevice/QuantizationDevice.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverterDevice/EncodingDevice.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverterDevice/FilteredSamplingDevice.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverterDevice/FilteredQuantizationDevice.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverterDevice/FilteredEncodingDevice.rb';
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize()
		@display = ADConverterDisplay.new(self); # ディスプレイ
		@samplingParameter = SamplingParameter.new(); # サンプリングパラメータ
		@movingAverageParameter = MovingAverageParameter.new(); # 移動平均パラメータ
		@samplingDevice = self.createSamplingDevice(); # 標本化デバイス
		@quantizationDevice = self.createQuantizationDevice(); # 量子化デバイス
		@encodingDevice = self.createEncodingDevice(); # 符号化デバイス
		@filteredSamplingDevice = self.createFilteredSamplingDevice(); # 平滑化処理付き標本化デバイス
		@filteredQuantizationDevice = self.createFilteredQuantizationDevice(); # 平滑化処理付き量子化デバイス
		@filteredEncodingDevice = self.createFilteredEncodingDevice(); # 平滑化処理付き符号化デバイス
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
	# 平滑化処理付き標本化デバイス生成
	def createFilteredSamplingDevice()
		sTime = @samplingParameter.samplingTime;
		sCycle = @samplingParameter.samplingCycle;
		sCount = getSamplingCount(sTime, sCycle);
		mvPoint = @movingAverageParameter.movingPoint;
		return FilteredSamplingDevice.new(sCount, mvPoint);
	end
	# 平滑化処理付き量子化デバイス生成
	def createFilteredQuantizationDevice()
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
		return FilteredQuantizationDevice.new(vMin, vMax, sCount, w, e);
	end
	# 平滑化処理付き符号化デバイス生成
	def createFilteredEncodingDevice()
		sTime = @samplingParameter.samplingTime;
		sCycle = @samplingParameter.samplingCycle;
		sCount = getSamplingCount(sTime, sCycle);
		qBit = @samplingParameter.quantizationBit;
		return FilteredEncodingDevice.new(sCount, qBit);
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
	# 平滑化処理付き標本化
	def filteredSampling()
		@filteredSamplingDevice.filteredSampling(@samplingDevice.sData);
	end
	# 平滑化処理付き量子化
	def filteredQuantize()
		@filteredQuantizationDevice.filteredQuantize(@filteredSamplingDevice.fsData);
	end
	# 平滑化処理付き符号化
	def filteredEncoding()
		@filteredEncodingDevice.filteredEncoding(@filteredQuantizationDevice.fqData);
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
	# 平滑化処理付き標本化結果を出力
	def writeFilteredSamplingData()
		@filteredSamplingDevice.writeData();
	end
	# 平滑化処理付き量子化結果を出力
	def writeFilteredQuantizationData()
		@filteredQuantizationDevice.writeData();
	end
	# 平滑化処理付き符号化結果を出力
	def writeFilteredEncodingData()
		@filteredEncodingDevice.writeData();
	end

	# サンプリングパラメータの表示
	def displaySamplingParameter()
		@display.displaySamplingParameter();
	end
	# 移動平均パラメータの表示
	def displayMovingAverageParameter()
		@display.displayMovingAverageParameter();
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
	# 平滑化処理付き標本化結果の出力ファイルのパス表示
	def displayFilteredSamplingDataFile()
		@display.displayFilteredSamplingDataFile();
	end
	# 平滑化処理付き量子化結果の出力ファイルのパス表示
	def displayFilteredQuantizationDataFile()
		@display.displayFilteredQuantizationDataFile();
	end
	# 平滑化処理付き符号化結果の出力ファイルのパス表示
	def displayFilteredEncodingDataFile()
		@display.displayFilteredEncodingDataFile();
	end

	# アクセスメソッド
	attr_reader :samplingParameter;
	attr_reader :movingAverageParameter;
	attr_reader :samplingDevice;
	attr_reader :quantizationDevice;
	attr_reader :encodingDevice;
	attr_reader :filteredSamplingDevice;
	attr_reader :filteredQuantizationDevice;
	attr_reader :filteredEncodingDevice;
end