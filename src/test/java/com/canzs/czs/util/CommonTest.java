package com.canzs.czs.util;

import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

public class CommonTest {

	@Test
	public void test01() {
		Set<Long> set = new HashSet<>();
		set.add(Long.valueOf(1));
		set.add(Long.valueOf(2));
		set.add(Long.valueOf(3));

		assertTrue(set.contains(Long.valueOf(1)));
		assertTrue(set.contains(Long.valueOf(2)));
		assertTrue(set.contains(Long.valueOf(3)));
		assertTrue(set.contains(Long.valueOf(4)));
	}


}
