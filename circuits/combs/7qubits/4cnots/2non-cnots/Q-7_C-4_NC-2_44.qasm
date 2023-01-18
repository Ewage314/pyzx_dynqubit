OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[3], q[4];
cx q[5], q[2];
x q[6];
x q[5];
cx q[5], q[0];
cx q[3], q[2];
