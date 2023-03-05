OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[7];
cx q[15], q[14];
cx q[15], q[8];
cx q[7], q[14];
cx q[13], q[0];
