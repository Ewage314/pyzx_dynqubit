OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[7];
x q[13];
cx q[9], q[4];
cx q[6], q[11];
cx q[11], q[15];
