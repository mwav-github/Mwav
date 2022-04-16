package net.mwav.common.module;

import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.file.*;
import java.nio.file.WatchEvent.Kind;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class WatchServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(WatchServiceTest.class);

	private WatchKey watchKey;

	@Test @Ignore
	public void test() throws IOException {
		boolean testBoolean = fileChanged();
		assertEquals(testBoolean, true);
	}

	public boolean fileChanged() throws IOException {
		boolean modified = false;
		WatchService watchService = FileSystems.getDefault().newWatchService();
		// 경로 생성
		Path path = Paths.get("./src/main/webapp/xConfig/");
		// 해당 디렉토리 경로에 와치서비스와 이벤트 등록
		path.register(watchService, StandardWatchEventKinds.ENTRY_MODIFY);

		while (true) {
			try {
				watchKey = watchService.take();// 이벤트가 오길 대기(Blocking)
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			List<WatchEvent<?>> events = watchKey.pollEvents();// 이벤트들을 가져옴
			for (WatchEvent<?> event : events) {
				// 이벤트 종류
				Kind<?> kind = event.kind();
				logger.debug("경로출력" + "./src/main/webapp/xConfig/footer.xml");
				if (kind.equals(StandardWatchEventKinds.ENTRY_MODIFY)) {
					modified = true;
					break;
				}
			}
			if (modified)
				break;
			if (!watchKey.reset()) {
				try {
					watchService.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return modified;
	}
}
