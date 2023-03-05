OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[5];
cx q[9], q[7];
cx q[4], q[12];
x q[15];
cx q[0], q[3];
cx q[10], q[13];
