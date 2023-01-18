OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[4], q[0];
cx q[5], q[6];
x q[4];
x q[4];
cx q[6], q[0];
cx q[5], q[4];
