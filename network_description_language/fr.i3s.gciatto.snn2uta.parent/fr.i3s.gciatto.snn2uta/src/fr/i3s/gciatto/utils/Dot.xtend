package fr.i3s.gciatto.utils

import java.io.InputStream
import java.io.BufferedInputStream
import java.io.BufferedOutputStream
import java.util.function.Consumer

class Dot {
	
	static def void invokeSync(InputStream stdin, Consumer<InputStream> consumeStdout) {
		val proc = new ProcessBuilder("dot", "-Tpng", "-o").start()
		
		val BufferedInputStream bis = new BufferedInputStream(stdin);
		val BufferedOutputStream bos = new BufferedOutputStream(proc.outputStream);
		
		val buff = newByteArrayOfSize(1024)
		var read = 0
		while ((read = bis.read(buff)) > 0) {
			bos.write(buff)
		}
		bis.close();
		bos.close();
		consumeStdout.accept(proc.inputStream);
		proc.waitFor
	}
} 