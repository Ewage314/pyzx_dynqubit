OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[9], q[1];
cx q[3], q[12];
cx q[7], q[14];
