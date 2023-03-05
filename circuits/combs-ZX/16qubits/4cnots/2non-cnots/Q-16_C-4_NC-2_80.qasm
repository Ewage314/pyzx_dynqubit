OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
z q[11];
x q[6];
cx q[10], q[3];
cx q[8], q[12];
cx q[5], q[1];
