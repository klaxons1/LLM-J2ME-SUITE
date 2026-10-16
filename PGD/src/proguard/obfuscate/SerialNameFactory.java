package proguard.obfuscate;

import java.util.Random;

public class SerialNameFactory implements NameFactory
{
	protected static Random rnd = new Random();
	
	protected static int randomInRange(int from, int to)
	{
		return from + (rnd.nextInt() & 0x7FFFFFFF) % (to - from + 1);
	}
	
	protected String prefix;
	protected int number;
	
	public SerialNameFactory(String prefix)
	{
		this.prefix = prefix;
		reset();
	}
	
	public void reset()
	{
		number = 0;
	}
	
	public String nextName()
	{
		number += randomInRange(10, 100);
		return prefix + Integer.toHexString(number);
	}
}