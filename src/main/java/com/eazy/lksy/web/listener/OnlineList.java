package com.eazy.lksy.web.listener;

public class OnlineList {
	private static final OnlineList onlineList = new OnlineList();
	private int maxSession;
	private int activeSession;

	private OnlineList() {
		// v = new Vector();
	}

	public static OnlineList getInstance() {
		return onlineList;
	}

	public void addSession() {
		activeSession++;
		if (activeSession >= maxSession) {
			maxSession = activeSession;
		}
	}

	public void delSession() {
		if (activeSession > 0)
			activeSession--;
	}

	public int getActiveSession() {
		return activeSession;
	}

	public int getmaxSession() {
		return maxSession;
	}
}