package jdbc.test;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

class NIOBlacked implements Runnable{
	private final SocketChannel sc;
	public NIOBlacked(SocketChannel sc){
		this.sc = sc;
	}
	
	public void run(){
		System.out.println("Waiting for read() in " + this);
		try {
			sc.read(ByteBuffer.allocate(1));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Exiting NIOBlocked.run() " + this);
	}
}

public class NIOInterruption {
	public static void main(String[] args) throws IOException, InterruptedException {
		ExecutorService exec = Executors.newCachedThreadPool();
		InetSocketAddress isa = new InetSocketAddress("localhost", 8080);
		SocketChannel sc1 = SocketChannel.open(isa);
		SocketChannel sc2 = SocketChannel.open(isa);
		Future<?> f = exec.submit(new NIOBlacked(sc1));
		exec.execute(new NIOBlacked(sc2));
		exec.shutdown();
		TimeUnit.SECONDS.sleep(1);
		f.cancel(true);
		TimeUnit.SECONDS.sleep(1);
		sc2.close();
	}
}
