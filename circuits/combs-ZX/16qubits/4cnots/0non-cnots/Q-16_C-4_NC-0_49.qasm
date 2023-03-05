OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[4];
cx q[1], q[12];
cx q[1], q[8];
cx q[15], q[6];
