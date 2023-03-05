OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[7];
x q[4];
cx q[13], q[8];
cx q[7], q[1];
x q[0];
cx q[15], q[4];
