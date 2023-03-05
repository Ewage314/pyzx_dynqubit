OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[5], q[3];
cx q[13], q[6];
x q[15];
cx q[15], q[11];
