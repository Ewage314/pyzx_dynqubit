OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[3];
z q[7];
cx q[2], q[1];
cx q[11], q[15];
cx q[6], q[13];
