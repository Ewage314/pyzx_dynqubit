OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[7];
cx q[15], q[8];
cx q[7], q[13];
cx q[9], q[7];
cx q[10], q[7];
