OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[15], q[4];
x q[7];
cx q[8], q[3];
cx q[15], q[13];
