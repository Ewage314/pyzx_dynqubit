OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[13];
cx q[3], q[6];
x q[7];
cx q[1], q[9];
cx q[15], q[1];
