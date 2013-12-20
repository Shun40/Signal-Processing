# 添付資料4(6) #

module OutputModule
	# 出力ディレクトリパス
	DIR_PATH = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/OutputFiles/";

	# データをファイルへ出力
	def writeFile(fileName, dftRe, dftIm, fftRe, fftIm, n)
		file = File.open(fileName, "w+");
		line = "k" + "," + "DFTRe" + "," + "DFTIm" + "," + "FFTRe" + "," + "FFTIm" + "\n";
		file.write(line);
		for i in 0..n-1 do
			kStr = i.to_s(); # k
			dftReStr = dftRe[i].to_s(); # DFT実部データ
			dftImStr = dftIm[i].to_s(); # DFT虚部データ
			fftReStr = fftRe[i].to_s(); # FFT実部データ
			fftImStr = fftIm[i].to_s(); # FFT虚部データ
			line = kStr + "," + dftReStr + "," + dftImStr + "," + fftReStr + "," + fftImStr + "\n";
			file.write(line);
		end
		file.close();
	end

	# ファイル名を標準入力から読み込んで返す
	def getFileName()
		print "Output file name ?" + "\n";
		print ">>";
		return DIR_PATH + gets().chomp() + ".csv";
	end

	module_function :writeFile;
	module_function :getFileName;
end