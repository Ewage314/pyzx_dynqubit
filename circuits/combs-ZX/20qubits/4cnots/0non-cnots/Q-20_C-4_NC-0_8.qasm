OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[3];
cx q[4], q[1];
cx q[1], q[17];
cx q[15], q[6];
