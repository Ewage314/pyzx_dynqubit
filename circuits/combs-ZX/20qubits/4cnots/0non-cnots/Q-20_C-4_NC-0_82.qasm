OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[6];
cx q[18], q[17];
cx q[4], q[2];
cx q[11], q[0];
