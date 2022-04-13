package geaj.chapterthree;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public final class EMF {
	private static final EntityManagerFactory emfInstance = Persistence.createEntityManagerFactory("GAEJ-ChaterThree");
	private EMF() {}
	public static EntityManagerFactory get() {
		return emfInstance;
	}
}