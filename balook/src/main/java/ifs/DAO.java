package ifs;

public interface DAO<T> {

	public void create(T data);
	
	public T read(int id);
	
	public void update(T data);
	
	public void delete(int id);
}
