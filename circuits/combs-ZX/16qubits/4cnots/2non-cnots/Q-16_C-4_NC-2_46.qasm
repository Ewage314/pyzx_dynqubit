OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[0];
x q[6];
cx q[10], q[9];
cx q[8], q[15];
z q[15];
cx q[15], q[1];
