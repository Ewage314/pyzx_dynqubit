OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[7];
x q[1];
cx q[11], q[16];
cx q[15], q[16];
cx q[11], q[0];
