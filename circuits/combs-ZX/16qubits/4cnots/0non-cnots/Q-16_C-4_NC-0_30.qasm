OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[0];
cx q[7], q[6];
cx q[2], q[7];
cx q[10], q[8];
