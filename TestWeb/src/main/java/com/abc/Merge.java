package com.abc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class Merge {
	public Set<Integer> merge() {
		List<Integer> a = new ArrayList<Integer>();
		a.add(128);
		a.add(34);
		a.add(23);
		a.add(17);
		a.add(10);
		a.add(0);
		List<Integer> b = new ArrayList<Integer>();
		b.add(1352);
		b.add(127);
		b.add(34);
		b.add(23);
		b.add(17);
		b.add(9);
		b.add(0);
		Set<Integer> s = new HashSet<Integer>();
		s.addAll(a);
		s.addAll(b);
		List<Integer> s2 = new ArrayList<Integer>(s);
		Collections.sort(s2,Collections.reverseOrder());
		s = new LinkedHashSet<Integer>(s2);
		return s;
	}
}
