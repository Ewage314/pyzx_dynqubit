OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[8];
cx q[4], q[3];
cx q[7], q[11];
cx q[3], q[6];
